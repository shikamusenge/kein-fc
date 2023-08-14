<%@include file="connection.jsp" %>
<%@ page language="java" contentType="application/pdf; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>

<%
try {
    String start = request.getParameter("startDate");
    String end = request.getParameter("endDate");
    String sql = "SELECT Date, Mt_id, Play_Ground, CONCAT_WS(' ', F_Name, L_Name) as Referee, Name as Adversary FROM Matches INNER JOIN Referees ON Matches.Ref_id = Referees.Ref_id INNER JOIN Adversaries ON Matches.Ad_id = Adversaries.Ad_id WHERE Matches.Date BETWEEN ? AND ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1,start);
    stmt.setString(2,end);
    ResultSet rs = stmt.executeQuery();
    
    Document document = new Document();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    PdfWriter writer = PdfWriter.getInstance(document, baos);
    
    document.open();
    // Add a Heading
    Font headingFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
    Paragraph heading = new Paragraph("Kein FC matches Report From "+start+" up to "+end, headingFont);
    heading.setAlignment(Element.ALIGN_CENTER);
    document.add(heading);
    
    document.add(Chunk.NEWLINE); // Add some space
    
    // Add Date
    Font dateFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
    Paragraph dateParagraph = new Paragraph("Date: " + new java.util.Date(), dateFont);
    dateParagraph.setAlignment(Element.ALIGN_RIGHT);
    document.add(dateParagraph);
    
    document.add(Chunk.NEWLINE); // Add some space
    PdfPTable table = new PdfPTable(6);
    table.addCell("No");
    table.addCell("Date");
    table.addCell("Match ID");
    table.addCell("Playground");
    table.addCell("Referee");
    table.addCell("Adversary");
    int n=1;
    while (rs.next()) {
        table.addCell(""+n);
        table.addCell(rs.getString("Date"));
        table.addCell(rs.getString("Mt_id"));
        table.addCell(rs.getString("Play_Ground"));
        table.addCell(rs.getString("Referee"));
        table.addCell(rs.getString("Adversary"));
        n++;
    }
    
    document.add(table);
    document.close();
    rs.close();
    stmt.close();
    conn.close();
    
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "inline; filename=report.pdf");
    OutputStream outputStream = response.getOutputStream();
    baos.writeTo(outputStream);
    outputStream.flush();

    
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

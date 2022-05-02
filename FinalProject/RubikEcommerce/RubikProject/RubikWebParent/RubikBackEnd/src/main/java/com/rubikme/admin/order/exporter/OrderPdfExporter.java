package com.rubikme.admin.order.exporter;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.User;

public class OrderPdfExporter extends AbstractExporter{
	
	public void export(List<Order> listOrders, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/pdf", ".pdf", "Orders_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLUE);
		
		Paragraph para = new Paragraph("List of orders", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, listOrders);
		
		document.add(table);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, List<Order> listOrders) {
		
		for (Order order : listOrders) {
			table.addCell(String.valueOf(order.getId()));
			table.addCell(String.valueOf(order.getAddressFinal()));
			table.addCell(String.valueOf(order.getOrderTime()));
			table.addCell(String.valueOf("$" + String.format("%.2f", order.getSubtotal())));
			table.addCell(String.valueOf(order.getStatus()));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("Order ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Address Deliver", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Order Time", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Subtotal", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Status", font));
		table.addCell(cell);
	}
}

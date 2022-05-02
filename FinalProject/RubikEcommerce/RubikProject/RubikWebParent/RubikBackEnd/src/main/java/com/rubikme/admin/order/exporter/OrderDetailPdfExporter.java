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
import com.rubikme.common.entity.Address;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.OrderDetail;
import com.rubikme.common.entity.User;

public class OrderDetailPdfExporter extends AbstractExporter{
	
	public void export(Order order, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/pdf", ".pdf", "Orders_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(24);
		font.setColor(Color.BLUE);
		
		Font fontHeader = FontFactory.getFont(FontFactory.TIMES_ITALIC);
		font.setSize(13);
		font.setColor(Color.BLACK);
		
		Paragraph para = new Paragraph("Order Detail", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		para.setSpacingAfter(30);
		para.setSpacingBefore(10);
		
		Paragraph paraNameCustomer = new Paragraph("Name Customer: " + getNameCustomer(order), fontHeader);
		paraNameCustomer.setAlignment(Paragraph.ALIGN_LEFT);
		
		Paragraph paraAddressCustomer = new Paragraph("Address: " + getAddressCustomer(order), fontHeader);
		paraAddressCustomer.setAlignment(Paragraph.ALIGN_LEFT);
		
		Paragraph paraPhoneCustomer = new Paragraph("Phone Number: " + order.getCustomer().getPhoneNumber(), fontHeader);
		paraPhoneCustomer.setAlignment(Paragraph.ALIGN_LEFT);
		paraPhoneCustomer.setSpacingAfter(10);
		
		document.add(para);
		document.add(paraNameCustomer);
		document.add(paraAddressCustomer);
		document.add(paraPhoneCustomer);
		
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, order);
		
		document.add(table);
		
		Paragraph paraSubtotal = new Paragraph("Subtotal: $" + order.getSubtotal(), fontHeader);
		paraSubtotal.setAlignment(Paragraph.ALIGN_RIGHT);
		paraSubtotal.setSpacingBefore(10);
		
		document.add(paraSubtotal);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, Order order) {
		
		for (OrderDetail orderDetail : order.getOrderDetails()) {
			table.addCell(String.valueOf(orderDetail.getId()));
			table.addCell(String.valueOf(orderDetail.getProduct().getName()));
			table.addCell(String.valueOf(orderDetail.getQuantity()));
			table.addCell(String.valueOf("$" + String.format("%.2f", orderDetail.getUnitPrice())));
			table.addCell(String.valueOf("$" + String.format("%.2f", orderDetail.getSubtotal())));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.DARK_GRAY);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Name product", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Quantity", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Unit Prices", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Total", font));
		table.addCell(cell);
	}
	
	private String getNameCustomer(Order order) {
		return order.getCustomer().getFullName();
	}
	
	private String getAddressCustomer(Order order) {
		
		return order.getAddressFinal();
	}
}

package com.rubikme.admin.customer.exporter;

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
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.User;

public class CustomerPDFExporter extends AbstractExporter{
	
	public void export(List<Customer> listCustomers, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/pdf", ".pdf", "Customers_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLUE);
		
		Paragraph para = new Paragraph("List of customers", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		
		PdfPTable table = new PdfPTable(6);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, listCustomers);
		
		document.add(table);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, List<Customer> listCustomers) {
		
		for (Customer customer : listCustomers) {
			table.addCell(String.valueOf(customer.getId()));
			table.addCell(String.valueOf(customer.getEmail()));
			table.addCell(String.valueOf(customer.getFullName()));
			table.addCell(String.valueOf(customer.getPhoneNumber()));
			table.addCell(String.valueOf(customer.getAddressLine()));
			table.addCell(String.valueOf(customer.isEnabled()));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("Customer ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("E-mail", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Full Name", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Phone", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Address", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Enabled", font));
		table.addCell(cell);
	}

}

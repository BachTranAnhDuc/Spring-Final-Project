package com.rubikme.admin.product.exporter;

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
import com.rubikme.common.entity.Product;

public class ProductPdfExporter extends AbstractExporter{
	public void export(List<Product> listProducts, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/pdf", ".pdf", "Products_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLUE);
		
		Paragraph para = new Paragraph("List of products", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		
		PdfPTable table = new PdfPTable(8);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, listProducts);
		
		document.add(table);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, List<Product> listProducts) {
		
		for (Product product : listProducts) {
			table.addCell(String.valueOf(product.getId()));
			table.addCell(String.valueOf(product.getName()));
			table.addCell(String.valueOf(product.getAlias()));
			table.addCell(String.valueOf(product.isEnabled()));
			table.addCell(String.valueOf(product.isInStock()));
			table.addCell(String.valueOf(product.getCost()));
			table.addCell(String.valueOf(product.getPrice()));
			table.addCell(String.valueOf(product.getDiscountPercent()));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("Product ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Name", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Alias", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Enabled", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Instock", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Cost", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Price", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Discount Percent", font));
		table.addCell(cell);
	}
}

package com.rubikme.admin.brand.exporter;

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
import com.rubikme.common.entity.User;

public class BrandPDFExporter extends AbstractExporter{
	
	public void export(List<Brand> listBrands, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/pdf", ".pdf", "Brands_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLUE);
		
		Paragraph para = new Paragraph("List of brands", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, listBrands);
		
		document.add(table);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, List<Brand> listBrands) {
		
		for (Brand brand : listBrands) {
			table.addCell(String.valueOf(brand.getId()));
			table.addCell(String.valueOf(brand.getName()));
			table.addCell(String.valueOf(brand.getCategories().toString()));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("Brand ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Brand Name", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Categories", font));
		table.addCell(cell);
		
	}

}

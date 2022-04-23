package com.rubikme.admin.category.exporter;

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
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.User;

public class CategoryPDFExport extends AbstractExporter{
	
	public void export(List<Category> listCategory, HttpServletResponse response) throws IOException {
		
		super.setResponseHeader(response, "application/pdf", ".pdf", "Categories_");
		
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setSize(18);
		font.setColor(Color.BLUE);
		
		Paragraph para = new Paragraph("List of categories", font);
		para.setAlignment(Paragraph.ALIGN_CENTER);
		
		document.add(para);
		
		PdfPTable table = new PdfPTable(2);
		table.setWidthPercentage(100f);
		table.setSpacingBefore(10);
		
		writeTableHeader(table);
		writeTableData(table, listCategory);
		
		document.add(table);
		
		document.close();
	}

	private void writeTableData(PdfPTable table, List<Category> listCategory) {
		
		for (Category cate : listCategory) {
			table.addCell(String.valueOf(cate.getId()));
			table.addCell(String.valueOf(cate.getName()));
		}
	}

	private void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.BLUE);
		cell.setPadding(5);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
//		font.setSize(18);
		font.setColor(Color.WHITE);
		
		cell.setPhrase(new Phrase("Category ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Name", font));
		table.addCell(cell);
		
	}
}

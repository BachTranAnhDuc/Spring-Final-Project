package com.rubikme.admin.order.exporter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.User;

public class OrderExcelExporter extends AbstractExporter{
	
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	
	public OrderExcelExporter() {
		workbook = new XSSFWorkbook();
	}
	
	private void writeHeaderLine() {
		sheet = workbook.createSheet("Orders");
		XSSFRow row = sheet.createRow(0);
		
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		cellStyle.setFont(font);
		
		createCell(row, 0, "Order ID", cellStyle);
		createCell(row, 1, "Address Deliver", cellStyle);
		createCell(row, 2, "Order Time", cellStyle);
		createCell(row, 3, "Payment Method", cellStyle);
		createCell(row, 4, "Subtotal", cellStyle);
		createCell(row, 5, "Status", cellStyle);
		createCell(row, 6, "Deliver Days", cellStyle);
		createCell(row, 7, "Deliver Date", cellStyle);
	}
	
	private void createCell(XSSFRow row, int columnIndex, Object value, CellStyle style) {		
		XSSFCell cell = row.createCell(columnIndex);
		sheet.autoSizeColumn(columnIndex);
		
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		}
		else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		} 
		else if (value instanceof Date) {
			cell.setCellValue((Date) value);
		}
		else if (value instanceof Float) {
			cell.setCellValue((Float) value);
		}
		else {
			cell.setCellValue((String) value);
		}
		
		cell.setCellStyle(style);
	}
	
	private void writeDataLine(List<Order> listOrder) {
		int rowIndex = 1;
		
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		cellStyle.setFont(font);
		
		for (Order order : listOrder) {
			XSSFRow row = sheet.createRow(rowIndex++);
			int columnIndex = 0;
			
			createCell(row, columnIndex++, order.getId(), cellStyle);
			createCell(row, columnIndex++, order.getAddressFinal(), cellStyle);
			createCell(row, columnIndex++, order.getOrderTime(), cellStyle);
			createCell(row, columnIndex++, order.getPaymentMethod().toString(), cellStyle);
			createCell(row, columnIndex++, String.format("%.2f", order.getSubtotal()), cellStyle);
			createCell(row, columnIndex++, order.getStatus().toString(), cellStyle);
			createCell(row, columnIndex++, order.getDeliverDays(), cellStyle);
			createCell(row, columnIndex++, order.getDeliverDate().toString(), cellStyle);
		}
	}
	
	public void export(List<Order> listOrders, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/octet-stream", ".xlsx", "Orders_");
		
		writeHeaderLine();
		writeDataLine(listOrders);
		
		ServletOutputStream outputStream = response.getOutputStream();
		
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}
}

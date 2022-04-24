package com.rubikme.admin.product.exporter;

import java.io.IOException;
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
import org.springframework.beans.factory.annotation.Autowired;

import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.admin.order.OrderService;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.OrderDetail;
import com.rubikme.common.entity.Product;

public class ProductExcelExporter extends AbstractExporter{
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	
	public ProductExcelExporter() {
		workbook = new XSSFWorkbook();
	}
	
	private void writeHeaderLine() {
		sheet = workbook.createSheet("Products");
		XSSFRow row = sheet.createRow(0);
		
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		cellStyle.setFont(font);
		
		createCell(row, 0, "Product ID", cellStyle);
		createCell(row, 1, "Name", cellStyle);
		createCell(row, 2, "Alias", cellStyle);
		createCell(row, 3, "Short Description", cellStyle);
		createCell(row, 4, "Full Description", cellStyle);
		createCell(row, 5, "Enabled", cellStyle);
		createCell(row, 6, "In Stock", cellStyle);
		createCell(row, 7, "Cost", cellStyle);
		createCell(row, 8, "Price", cellStyle);
		createCell(row, 9, "Discount Percent", cellStyle);
		createCell(row, 10, "Total comment", cellStyle);
		createCell(row, 11, "Average Rate", cellStyle);
		createCell(row, 12, "Total Quantity Sells", cellStyle);
		createCell(row, 13, "Total Price Sells", cellStyle);
		createCell(row, 14, "Revenue Quantity", cellStyle);
		createCell(row, 15, "Revenue Price", cellStyle);
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
		else if (value instanceof Float) {
			cell.setCellValue((Float) value);
		}
		else {
			cell.setCellValue((String) value);
		}
		
		cell.setCellStyle(style);
	}
	
	private void writeDataLine(List<Product> listProducts, List<Order> listOrders) {
		int rowIndex = 1;
		
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		cellStyle.setFont(font);
		
		XSSFRow row = null;
		
		int revenue = 0;
		int revenueProduct = 0;
		
		for (Product product : listProducts) {
			
			row = sheet.createRow(rowIndex++);
			
			int columnIndex = 0;
						
			int countQuantity = 0;
			int totalPrices = 0;
			
			for (Order order : listOrders) {				
				
				for (OrderDetail orderDetail : order.getOrderDetails()) {
					if (product.getId() == orderDetail.getProduct().getId()) {
						countQuantity += orderDetail.getQuantity();
						totalPrices += orderDetail.getSubtotal();
						revenue += orderDetail.getSubtotal();
						revenueProduct += orderDetail.getQuantity();
					}
				}
			}
			
			createCell(row, columnIndex++, product.getId(), cellStyle);
			createCell(row, columnIndex++, product.getName(), cellStyle);
			createCell(row, columnIndex++, product.getAlias(), cellStyle);
			createCell(row, columnIndex++, product.getShortDescription(), cellStyle);
			createCell(row, columnIndex++, product.getFullDescription(), cellStyle);
			createCell(row, columnIndex++, product.isEnabled(), cellStyle);
			createCell(row, columnIndex++, product.isInStock(), cellStyle);
			createCell(row, columnIndex++, product.getCost(), cellStyle);
			createCell(row, columnIndex++, product.getPrice(), cellStyle);
			createCell(row, columnIndex++, product.getDiscountPercent(), cellStyle);
			createCell(row, columnIndex++, product.getReviewCount(), cellStyle);
			createCell(row, columnIndex++, product.getAverageRating(), cellStyle);
			createCell(row, columnIndex++, countQuantity, cellStyle);
			createCell(row, columnIndex++, totalPrices, cellStyle);
			
		}
		
		createCell(row, 14, revenueProduct, cellStyle);
		createCell(row, 15, revenue, cellStyle);
	}
	
	public void export(List<Product> listProducts, List<Order> listOrders, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "application/octet-stream", ".xlsx", "Products_");
		
		writeHeaderLine();
		writeDataLine(listProducts, listOrders);
		
		
		ServletOutputStream outputStream = response.getOutputStream();
		
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}
}

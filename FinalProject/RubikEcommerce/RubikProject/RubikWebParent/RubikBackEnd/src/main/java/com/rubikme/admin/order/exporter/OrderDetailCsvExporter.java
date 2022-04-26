package com.rubikme.admin.order.exporter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.User;

public class OrderDetailCsvExporter extends AbstractExporter{
	
	public void export(List<Order> listOrders, HttpServletResponse response) throws IOException {
		super.setResponseHeader(response, "text/csv", ".csv", "Orders_");
		
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
		
		String[] csvHeader = {"Order ID", "Address Deliver", "Order Time", "Payment Method", "Subtotal", "Status", "Deliver Days", "Deliver Date"};
		String[] fieldMapping = {"id", "addressFinal", "orderTime", "paymentMethod", "subtotal", "status", "deliverDays", "deliverDate"};
		
		csvWriter.writeHeader(csvHeader);
		
		for (Order order : listOrders) {
			csvWriter.write(order, fieldMapping);
		}

		csvWriter.close();
	}
}

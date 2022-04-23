package com.rubikme.admin.customer.exporter;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.common.entity.Customer;

public class CustomerCsvExporter extends AbstractExporter {
	
	public void export(List<Customer> listCustomers, HttpServletResponse response) 
			throws IOException {
		super.setResponseHeader(response, "text/csv", ".csv", "customers_");
		
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), 
				CsvPreference.STANDARD_PREFERENCE);
		
		String[] csvHeader = {"Customer ID", "E-mail", "First Name", "Last Name", "Phone Number", "Address", "Created Time", "Enabled"};
		String[] fieldMapping = {"id", "email", "firstName", "lastName", "phoneNumber", "addressLine", "createdTime", "enabled"};
		
		csvWriter.writeHeader(csvHeader);
		
		for (Customer customer : listCustomers) {
			csvWriter.write(customer, fieldMapping);
		}
		
		csvWriter.close();
	}
}

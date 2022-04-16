package com.rubikme.admin.product.exporter;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.rubikme.admin.exporter.AbstractExporter;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Product;

public class ProductCsvExporter extends AbstractExporter{
	
	public void export(List<Product> listProducts, HttpServletResponse response) 
			throws IOException {
		super.setResponseHeader(response, "text/csv", ".csv", "products_");
		
		ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), 
				CsvPreference.STANDARD_PREFERENCE);
		
		String[] csvHeader = {"Product ID", "Name", "Alias", "Short Description", "Full Description", "Enabled", "In Stock", "Cost", "Price", "Discount Percent", "Comment", "Rate"};
		String[] fieldMapping = {"id", "name", "alias", "shortDescription", "fullDescription", "enabled", "inStock", "cost", "price", "discountPercent", "reviewCount", "averageRating"};
		
		csvWriter.writeHeader(csvHeader);
		
		for (Product product : listProducts) {
			csvWriter.write(product, fieldMapping);
		}
		
		csvWriter.close();
	}
}

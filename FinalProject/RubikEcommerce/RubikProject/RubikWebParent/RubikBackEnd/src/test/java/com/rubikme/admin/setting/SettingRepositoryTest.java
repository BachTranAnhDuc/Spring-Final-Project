package com.rubikme.admin.setting;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.rubikme.common.entity.Setting;
import com.rubikme.common.entity.SettingCategory;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class SettingRepositoryTest {

	@Autowired
	SettingRepository repo;
	
//	@Test
//	public void testCreateGeneralSettings() {
//		//Setting siteName = new Setting("SITE_NAME", "Rubikme", SettingCategory.GENERAL);
//		//Setting siteName = new Setting("SITE_NAME", SettingCategory.GENERAL, "Rubikme");
//		Setting copyright = new Setting("COPYRIGHT", "Copyright (C) 2021 Rubikme", SettingCategory.GENERAL);
//		Setting logo = new Setting("SITE_LOGO", "logo.png", SettingCategory.GENERAL);
//		
//		repo.saveAll(List.of(siteName, copyright, logo));
//		
//		Iterable<Setting> iterable = repo.findAll();
//		
//		assertThat(iterable).size().isGreaterThan(0);
//	}
	
	@Test
	public void testCreateLogo() {
		Setting logo = new Setting("SITE_LOGO", "logo.png", SettingCategory.GENERAL);
		
		repo.save(logo);
		
	}
	
	@Test
	public void testCreateCurrencySetting() {
		Setting currencyId = new Setting("CURRENCY_ID", "1", SettingCategory.CURRENCY);
		Setting symbol = new Setting("CURRENCY_SYMBOL", "$", SettingCategory.CURRENCY);
		Setting symbolPosition = new Setting("CURRENCY_SYMBOL_POSITION", "before", SettingCategory.CURRENCY);
		Setting decimalPointType = new Setting("DECIMAL_POINT_TYPE", "POINT", SettingCategory.CURRENCY);
		Setting decimalDigits = new Setting("DECIMAL_DIGITS", "2", SettingCategory.CURRENCY);
		Setting thousandsPointType = new Setting("THOUSANDS_POINT_TYPE", "COMMA", SettingCategory.CURRENCY);
		
		repo.saveAll(List.of(currencyId, symbol, symbolPosition, decimalPointType, 
				decimalDigits, thousandsPointType));
	}
}

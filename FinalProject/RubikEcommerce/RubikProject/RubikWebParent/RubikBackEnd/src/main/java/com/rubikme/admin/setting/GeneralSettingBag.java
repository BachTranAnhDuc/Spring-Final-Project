package com.rubikme.admin.setting;

import java.util.List;

import com.rubikme.common.entity.Setting;
import com.rubikme.common.entity.SettingBag;

public class GeneralSettingBag extends SettingBag{

	public GeneralSettingBag(List<Setting> listSettings) {
		super(listSettings);
		// TODO Auto-generated constructor stub
		
	}
	
	public void updateCurrencySymbol(String value) {
		super.update("CURRENCY_SYMBOL", value);
	}
	
	public void updateSiteLogo(String value) {
		super.update("SITE_LOGO", value);
	}
}

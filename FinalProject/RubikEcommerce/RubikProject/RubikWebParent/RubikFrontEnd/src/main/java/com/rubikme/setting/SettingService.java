package com.rubikme.setting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Setting;
import com.rubikme.common.entity.SettingCategory;

@Service
public class SettingService {
	
	@Autowired
	private SettingRepository repo;
	
	public List<Setting> getGeneralSetting() {
		return repo.findByTwoCategories(SettingCategory.GENERAL, SettingCategory.CURRENCY);
	}
}

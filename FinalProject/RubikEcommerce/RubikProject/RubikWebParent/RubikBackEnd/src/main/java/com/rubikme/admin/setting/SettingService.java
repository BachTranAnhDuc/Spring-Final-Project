package com.rubikme.admin.setting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Setting;

@Service
public class SettingService {
	
	@Autowired
	private SettingRepository repo;
	
	public List<Setting> listAllSettings() {
		return (List<Setting>) repo.findAll();
	}
}

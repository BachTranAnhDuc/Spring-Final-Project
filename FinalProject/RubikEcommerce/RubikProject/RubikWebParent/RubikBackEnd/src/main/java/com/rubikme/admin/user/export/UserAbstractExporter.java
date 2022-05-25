package com.rubikme.admin.user.export;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.rubikme.common.entity.User;

public abstract class UserAbstractExporter {
	public abstract void export(List<User> listUsers, HttpServletResponse response) throws IOException;
	
	
//	Template method pattern
	public final void doExport(List<User> listUsers, HttpServletResponse response) throws IOException{
		export(listUsers, response);
	}
}

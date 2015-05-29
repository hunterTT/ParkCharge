package com.parkcharge.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.chenjie.util.DateUtils;
import com.chenjie.util.MySQLUtils;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.parkcharge.base.action.BaseAction;
import com.parkcharge.base.action.BaseActionImpl;
import com.parkcharge.sys.entity.Log;
import com.parkcharge.sys.service.LogService;

@SuppressWarnings("serial")
public class SystemManagerAction extends BaseActionImpl implements BaseAction {
	@Autowired
	private LogService logService;
	@Autowired
	private ComboPooledDataSource dataSource;

	@Override
	public String add() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String del() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String edit() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String editPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String jsonListPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getJsonList() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 备份数据库
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public String backupDB() {
		ServletRequest request = ServletActionContext.getRequest();
		String filePath = request.getRealPath("/");
		filePath = filePath.substring(0, filePath.length() - 2);
		filePath = filePath.substring(0, filePath.replace("\\", "/").lastIndexOf("/"));
		Date dt = new Date();
		String newFileName = filePath + "/backup/ParkCharge/" + DateUtils.formatDateAsyyyymmdd(dt) + "_" + DateUtils.formatTimeAshhmiss(dt) + ".sql";
		newFileName=newFileName.replace("\\", "/");
		System.out.println(newFileName);
		boolean isBackupSuccess = MySQLUtils.backupDB(dataSource.getUser(), dataSource.getPassword(), "parkcharge", newFileName);
		Log log = new Log();
		log.setActionDate(DateUtils.formatDate(dt));
		log.setActionName("数据备份");
		log.setManager("admin");
		Map<String, Object> map_json = new HashMap<String, Object>();

		if (isBackupSuccess == true) {
			map_json.put("data", "数据备份成功!文件名:" + newFileName);
			log.setOtherInfo("备份文件:" + newFileName + "  ，备份时间:" + DateUtils.formatTimeAshhmiss(dt));
		} else {
			map_json.put("data", "数据备份失败!");
			log.setOtherInfo("备份数据失败!");
		}

		logService.add(log);

		jsonobj = JSONObject.fromObject(map_json);

		return SUCCESS;
	}

}

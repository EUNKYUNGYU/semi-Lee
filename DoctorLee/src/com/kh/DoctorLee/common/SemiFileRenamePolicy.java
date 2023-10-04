package com.kh.DoctorLee.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SemiFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int randomNum = (int)(Math.random() * 90000) + 10000;
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = "Doctor_" + currentTime + "_" + randomNum + ext;
		
		return new File(originFile.getParent(), changeName);
	}
	
	

}


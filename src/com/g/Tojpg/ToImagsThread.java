package com.g.Tojpg;

import com.baje.sz.ajax.LogUtility;

public class ToImagsThread extends Thread {
	private String source_file="";
	private String des_file="";
	public ToImagsThread(String source_file,String des_file) {
		this.source_file=source_file;
		this.des_file=des_file;
	}
	@Override
	public void run() {
		LogUtility.log("ToImagsThread here..........");
		Pdf2Jpg pdf = new Pdf2Jpg();
		try {
			pdf.tranfer(source_file, des_file);
		} catch (Exception e) {
			LogUtility.log(e,"ToImagsThread is failure");
		}
		LogUtility.log("source_file-->"+source_file+"&des_file-->"+des_file);
		LogUtility.log("ToImagsThread is finish..........");
	}
}

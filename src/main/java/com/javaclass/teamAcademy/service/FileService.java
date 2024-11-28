package com.javaclass.teamAcademy.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileService {
	public static final String IMAGE_REPO ="C:/spring/image_repo";
	void fileProcess(MultipartHttpServletRequest mul);
	void getHomework(Model m);
}
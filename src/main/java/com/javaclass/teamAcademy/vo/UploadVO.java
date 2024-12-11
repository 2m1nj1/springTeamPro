package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class UploadVO {
    private int uploadNo;    	// Upload ID (PK)
    private String fileName; 	// 업로드된 파일 이름
    private String filePath; 	// 서버에 있는 파일 패치
    private long fileSize;   	// 파일 사이즈 바이트로 나타냄.
    
    // Service tbl
    private int serviceNo;		// 업로딩 서비스 구분 번호. (PK)
    private String serviceName; // 업로딩 서비스 번호에 따른 네임택.
}

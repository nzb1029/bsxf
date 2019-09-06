package org.bsxf.utils;

import org.springframework.http.HttpStatus;

public class ImportException extends RuntimeException {

	public HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

	public ImportException() {
	}

	public ImportException(HttpStatus status) {
		this.status = status;
	}

	public ImportException(String message) {
		super(message);
	}

	public ImportException(HttpStatus status, String message) {
		super(message);
		this.status = status;
	}
}

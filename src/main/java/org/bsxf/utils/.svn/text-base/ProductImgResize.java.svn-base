package org.bsxf.utils;

import com.ckfinder.connector.configuration.Events;
import com.ckfinder.connector.configuration.Plugin;
import com.ckfinder.connector.configuration.Events.EventTypes;

public class ProductImgResize extends Plugin {

	@Override
	public void registerEventHandlers(Events eventHandler) {
		// TODO Auto-generated method stub
		eventHandler.addEventHandler(EventTypes.AfterFileUpload, ProductImgResizeCommand.class, pluginInfo);

	}

}

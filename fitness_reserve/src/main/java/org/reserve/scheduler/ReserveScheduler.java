package org.reserve.scheduler;

import org.reserve.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;

@Component
public class ReserveScheduler {
	@Setter(onMethod_= {@Autowired})
	private ReserveService service;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void autoUpdate() throws Exception{
		service.autoUpdate();
	}
}

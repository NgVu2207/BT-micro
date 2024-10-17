import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { EventPattern, Payload } from '@nestjs/microservices';

Controller();
export class AppController {
  constructor(private readonly appService: AppService) {}

  @EventPattern("MAIL_INFO_NAME")
  sendMailInfOrder(@Payload() data) {
    return this.appService.sendMailInfoOrder(data);
  }
}

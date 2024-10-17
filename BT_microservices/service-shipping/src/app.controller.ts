import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { EventPattern, MessagePattern, Payload } from '@nestjs/microservices';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @EventPattern('SHIP_PRODUCT_NAME')
  shipping(@Payload() data) {
    return this.appService.shipping(data);
  }
}

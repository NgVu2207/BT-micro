import { Controller } from '@nestjs/common';
import { AppService } from './app.service';
import { MessagePattern, Payload } from '@nestjs/microservices';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @MessagePattern("ORDER_PRODUCT_NAME")
  order(@Payload() data) {
    return this.appService.order(data);
  }
}

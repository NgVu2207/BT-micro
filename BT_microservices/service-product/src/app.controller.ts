import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { EventPattern, MessagePattern, Payload } from '@nestjs/microservices';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @MessagePattern('SAVE_CACHE')
  saveCache() {
    return this.appService.saveCache();
  }

  @MessagePattern('DELETE_CACHE')
  deleteCache() {
    return this.appService.deleteCache();
  }

  @MessagePattern('FIND_PRODUCT')
  searchProduct(@Payload() data) {
    return this.appService.searchProduct(data);
  }
}

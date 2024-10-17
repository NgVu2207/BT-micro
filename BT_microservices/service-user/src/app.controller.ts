import { Body, Controller } from '@nestjs/common';
import { AppService } from './app.service';
import { MessagePattern } from '@nestjs/microservices';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @MessagePattern('LOGIN_USER')
  login(@Body() user) {
    return this.appService.login(user);
  }

  @MessagePattern('SIGNUP_USER')
  signUp(@Body() user) {
    return this.appService.signUp(user);
  }
}

import { Body, Controller, Inject, Post } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ClientProxy } from '@nestjs/microservices';
import { firstValueFrom } from 'rxjs';

@Controller('user')
export class UserController {
  constructor(
    private jwtService: JwtService,
    @Inject('USER_NAME') private userService: ClientProxy,
  ) {}

  @Post('/login')
  async login(@Body() user: { email: string; password: string }) {
    let res = this.userService.send('LOGIN_USER', user);
    return await firstValueFrom(res);
  }

  @Post('/signup')
  async signUp(@Body() user: { full_name: string; email: string; password: string }) {
      const res = this.userService.send('SIGNUP_USER', user);
      return await firstValueFrom(res);
  }
}

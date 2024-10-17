import { ConflictException, Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { JwtService } from '@nestjs/jwt';


@Injectable()
export class AppService {
  constructor(
    private prismaService: PrismaService,
    private jwtService: JwtService,
  ) {}


  async login(user: { email: string; password: string }) {
    let { email, password } = user;
    let checkUser = await this.prismaService.users.findFirst({
      where: {
        email,
        password,
      },
    });

    if (!checkUser) {
      throw new UnauthorizedException('Sai email hoặc password');
    }

    let token = this.jwtService.sign(
      { userId: checkUser.user_id },
      {
        expiresIn: '1d',
        secret: process.env.JWT_SECRET || 'BI_MAT',
      },
    );
    return { message: 'Đăng nhập thành công', token};;
  }

  async signUp(user: {full_name: string; email: string; password: string}) {
    let { full_name, email, password } = user;
    // check email
    let checkEmail = await this.prismaService.users.findFirst({
      where: {
        email,
      },
    });

    if (checkEmail) {
      throw new ConflictException('Email đã tồn tại');
    }

    const newUser =  await this.prismaService.users.create({
      data: {
        full_name,
        email,
        password, 
      },
    });

    const token = this.jwtService.sign(
        { userId: newUser.user_id },
        {
          expiresIn: '1d',
          secret: process.env.JWT_SECRET || 'BI_MAT',
        },
      );

    return { message: 'Đăng ký thành công' , token};
  }
}

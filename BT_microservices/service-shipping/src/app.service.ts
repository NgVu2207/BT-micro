import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';

@Injectable()
export class AppService {
  constructor(private prismaService: PrismaService) {}

  async shipping(data) {
    let { order_id, full_name, email, phone, address } = data;
    let newShip = {
      order_id: order_id,
      full_name: full_name,
      email: email,
      phone: phone,
      address: address,
      create_at: new Date(),
    };
    await this.prismaService.shipping.create({ data: newShip });
  }
}

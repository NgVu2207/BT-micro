import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';

@Injectable()
export class AppService {
  constructor(private prismaService: PrismaService) {}

  async order(data) {
    try {
      let { user_id, list_product } = data;
      let newOrder = {
        user_id: user_id,
        list_product: JSON.parse(list_product),
        create_at: new Date(),
      };

      let orderResult = await this.prismaService.orders.create({
        data: newOrder,
      });
      return orderResult;
    } catch {
      return null;
    }
  }
}

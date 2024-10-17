import {
  Body,
  Controller,
  Get,
  Headers,
  Inject,
  Post,
  Query,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ClientProxy } from '@nestjs/microservices';
import { lastValueFrom } from 'rxjs';

@Controller('product')
export class ProductController {
  constructor(
    private jwtService: JwtService,
    @Inject('PRODUCT_NAME') private productService: ClientProxy,
    @Inject('ORDER_NAME') private orderService: ClientProxy,
    @Inject('NOTIFY_NAME') private notifyService: ClientProxy,
    @Inject('SHIPPING_NAME') private shippingService: ClientProxy,
  ) {}

  @Get('/save-cache')
  async saveCache() {
    return await lastValueFrom(this.productService.send('SAVE_CACHE', ''));
  }

  @Get('/delete-cache')
  async deleteCache() {
    return await this.productService.send('DELETE_CACHE', '');
  }

  @Get('/search-product')
  async searchProduct(@Query('name') nameProduct) {
    return await lastValueFrom(
      this.productService.send('FIND_PRODUCT', nameProduct),
    );
  }

  @Post('/order')
  async order(@Headers('token') token, @Body() model) {
    let decode = this.jwtService.decode(token);

    let newOrder = {
      user_id: decode.userId,
      email: model.email,
      list_product: model.list_product,
      full_name: model.full_name,
      phone: model.phone,
      address: model.address,
    };
    // gọi order
    let orderResult = await lastValueFrom(
      this.orderService.send('ORDER_PRODUCT_NAME', newOrder),
    );

    if (orderResult != null) {
      //shipping
      this.shippingService.emit('SHIP_PRODUCT_NAME', {
        ...newOrder,
        order_id: orderResult.order_id,
      });
    }

    // gọi send email
    this.notifyService.emit('MAIL_INFO_NAME', newOrder);

    return 'thành công';
  }
}

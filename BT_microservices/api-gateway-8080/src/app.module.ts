import { Module } from '@nestjs/common';
import { ProductController } from './product/product.controller';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { JwtModule } from '@nestjs/jwt';
import { UserController } from './user/user.controller';

@Module({
  imports: [
    JwtModule.register({
      global: true,
    }),
    
    ClientsModule.register([
      {
        name: 'PRODUCT_NAME',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://admin:1234@some-rabbit:5672'],
          queue: 'product_queue',
          queueOptions: {
            durable: true,
          },
        },
      },
    ]),

    ClientsModule.register([
      {
        name: 'ORDER_NAME',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://admin:1234@some-rabbit:5672'],
          queue: 'order_queue',
          queueOptions: {
            durable: true,
          },
        },
      },
    ]),

    ClientsModule.register([
      {
        name: 'NOTIFY_NAME',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://admin:1234@some-rabbit:5672'],
          queue: 'notify_queue',
          queueOptions: {
            durable: true,
          },
        },
      },
    ]),

    ClientsModule.register([
      {
        name: 'SHIPPING_NAME',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://admin:1234@some-rabbit:5672'],
          queue: 'shipping_queue',
          queueOptions: {
            durable: true,
          },
        },
      },
    ]),

    ClientsModule.register([
      {
        name: 'USER_NAME',
        transport: Transport.RMQ,
        options: {
          urls: ['amqp://admin:1234@some-rabbit:5672'],
          queue: 'user_queue',
          queueOptions: {
            durable: true,
          },
        },
      },
    ]),
  ],
  controllers: [ProductController, UserController],
  providers: [],
})
export class AppModule {}

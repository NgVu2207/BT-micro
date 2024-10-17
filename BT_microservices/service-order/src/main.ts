import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import {WinstonModule} from 'nest-winston'
import * as winston from 'winston'


//service order
async function bootstrap() {
  const logger = WinstonModule.createLogger({
    defaultMeta: { service: "API Gateway" },
    transports: [
    new winston.transports.Console(),
    ],
    });

  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    AppModule,
    {
      logger,
      transport: Transport.RMQ,
      options: {
        urls: [`amqp://admin:1234@some-rabbit:5672`],
        queue: 'order_queue',
        queueOptions: {
          durable: true,
        },
      },
    },
  );
  await app.listen();
}
bootstrap();

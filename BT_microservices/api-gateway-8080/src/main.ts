import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import {WinstonModule} from 'nest-winston'
import * as winston from 'winston'

async function bootstrap() {
  const logger = WinstonModule.createLogger({
    defaultMeta: { service: "API Gateway" },
    transports: [
    new winston.transports.Console(),
    ],
    });
  const app = await NestFactory.create(AppModule,{logger});
  await app.listen(8080);
}
bootstrap();

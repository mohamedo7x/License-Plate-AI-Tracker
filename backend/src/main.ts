import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(process.env.PORT ?? 3000, ()=> {
    console.log(`Running Api in Mode ${process.env.NODE_ENV} on Port ${process.env.PORT} \n check Api Live http://localhost:${process.env.PORT} on Docker`)
  });
}
bootstrap();

import { Module } from '@nestjs/common';
import { AppService } from './app.service';
import { AppController } from './app.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import {entities} from './entites/index'

@Module({
  imports: [TypeOrmModule.forRoot({
    type:'mysql',
    host:process.env.MYSQL_HOST,
    port:Number(process.env.MYSQL_PORT)||3306,
    username:process.env.MYSQL_USER,
    password:process.env.MYSQL_PASSWORD,
    database:process.env.MYSQL_DBNAME,
    // migrations: ['src/migrations/*.ts'],
    entities,
    synchronize:false,
    migrationsRun:true,
  }),
  TypeOrmModule.forFeature((entities))
],
  providers: [AppService],
  controllers:[AppController]
})
export class AppModule {}

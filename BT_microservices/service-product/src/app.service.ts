import { Inject, Injectable } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { CACHE_MANAGER } from '@nestjs/cache-manager';
import { Cache } from 'cache-manager';
import { ElasticsearchService } from '@nestjs/elasticsearch';

@Injectable()
export class AppService {
  constructor(
    private prismaService: PrismaService,
    @Inject(CACHE_MANAGER) private cacheManager: Cache,
    private elasticService: ElasticsearchService,
  ) {}

  async saveCache() {
    let dataCache = await this.cacheManager.get('product');

    if (dataCache) {
      console.log('lấy từ cache');
      return dataCache;
    }

    let data = await this.prismaService.product.findMany();

    this.cacheManager.set('product', data);
    return data;
  }

  async deleteCache() {
    this.cacheManager.reset();
    return 'Đã xóa cache';
  }

  async searchProduct(nameProduct) {
    let data = await this.elasticService.search({
      index: "product-index",
      query: {
        match: {
          "name": nameProduct,
        },
      },
    });
    return data
  }
  catch (error) {
    if (error.meta.body.error.type === 'index_not_found_exception') {
      return 'Index not found. Please create the index first.';
    }
    throw error;
  }

}

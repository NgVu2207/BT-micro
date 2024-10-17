import { Injectable } from '@nestjs/common';
import { error } from 'console';
import * as nodemailer from 'nodemailer';
import { from } from 'rxjs';

@Injectable()
export class AppService {
  sendMailInfoOrder(data) {
    let { email, full_name } = data;
    let configMail = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'nhvv220798@gmail.com',
        pass: 'vzgvpxxqfjynrưfy',
      },
    });

    let infoMail = {
      from: 'nhv220798@gmail.com',
      to: email,
      subject: `Đã cập nhật đơn hàng - ${full_name} - ${email} `,
      html: '<h1>Xác nhận đơn hàng thành công</h1>',
    };

    configMail.sendMail(infoMail, (error) => error);
  }
}

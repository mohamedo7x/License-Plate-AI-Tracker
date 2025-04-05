import multer from 'multer';
import path from 'path';
import crypto from 'crypto';


const upload_img_police_users = multer.diskStorage({
    destination:(req , file , cb) => {

        if(req.path.includes('/police')){
            cb(null , path.join(__dirname , '..' , 'uploads' , 'images' , 'police_users'));
        }else{
            cb(null , path.join(__dirname , '..' , 'uploads' , 'images' , 'admin_users'));
        }
    },
    filename:(req , file , cb) => { 
        const filename = crypto.randomBytes(10).toString('hex') + path.extname(file.originalname);
        cb(null , filename);
        req.body.img_profile = filename;
    }
});


const upload_middleware = multer({ storage: upload_img_police_users });
export const uploadFile = upload_middleware.single('img_profile');

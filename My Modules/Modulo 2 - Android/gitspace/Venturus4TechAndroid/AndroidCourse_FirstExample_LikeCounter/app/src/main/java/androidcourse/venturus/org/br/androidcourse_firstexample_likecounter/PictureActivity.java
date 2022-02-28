package androidcourse.venturus.org.br.androidcourse_firstexample_likecounter;

import android.app.DownloadManager;
import android.net.*;
import  android.widget.*;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class PictureActivity extends Activity {


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_new);

        ImageView image = (ImageView) findViewById(R.id.marshmallow_image);
        image.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                DownloadManager downloadManager= (DownloadManager)getSystemService(DOWNLOAD_SERVICE);
                DownloadManager.Request request = new DownloadManager.Request(
                        Uri.parse("https://goo.gl/RnPVhk"));
                request.setTitle(getResources().getString(R.string.download_text));
                long downloadId = downloadManager.enqueue(request);
            }
        });

    }

    public void onClickImage(View view) {

        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }

}

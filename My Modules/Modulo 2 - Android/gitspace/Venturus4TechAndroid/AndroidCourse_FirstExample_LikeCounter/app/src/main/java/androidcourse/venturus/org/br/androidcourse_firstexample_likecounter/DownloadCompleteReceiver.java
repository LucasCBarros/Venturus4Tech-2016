package androidcourse.venturus.org.br.androidcourse_firstexample_likecounter;

import android.Manifest;
import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.Context;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.widget.Toast;


public class DownloadCompleteReceiver extends BroadcastReceiver {
    private long mDownloadId = -1;

    public DownloadCompleteReceiver(long DownloadId) {
        mDownloadId = DownloadId;
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (DownloadManager.ACTION_DOWNLOAD_COMPLETE.equals(action)) {
            long downloadId = intent.getLongExtra(
                    DownloadManager.EXTRA_DOWNLOAD_ID, 0);


            if (downloadId == mDownloadId) {
                Toast toast = Toast.makeText(context, R.string.download_complete_text, Toast.LENGTH_LONG);
                toast.show();
            }
        }
    }

//    private void checkPermissionAndDownload(){
//        if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)!= (PackageManager.PERMISSION_GRANTED)) {
//            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)){
//                Toast.makeText(this, R.string.permission_explanation__text, Toast.LENGTH_LONG).show();
//            }
//            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},MY_PERMISSIONS_REQUEST_WRITE_EXTERNAL_STORAGE);
//        } else {
//            doDownload();
//        }
//    }
//
//    @Override
//    public void onRequestPermissionResult (int requestCode, String permissions[], int[] grandResults) {
//        switch (requestCode){
//            case MY_PERMISSION_REQUEST_WRITE_STORAGE: {
//                if (grandResults.length > 0 && grandResults[0]== PackageManager.PERMISSION_GRANTED){
//                    doDownload();
//                } else {
//                    Toast.makeText(this, R.string.permission_denied_text, Toast.LENGTH_LONG).show();
//                }
//            return;
//            }
//        }
//    }
}

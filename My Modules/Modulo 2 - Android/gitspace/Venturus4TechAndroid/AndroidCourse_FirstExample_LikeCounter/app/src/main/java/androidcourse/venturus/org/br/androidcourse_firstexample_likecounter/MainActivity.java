package androidcourse.venturus.org.br.androidcourse_firstexample_likecounter;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.util.Log;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private int mLikeCounter = 0;

    private SharedPreferences mPrefs;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mPrefs = this.getSharedPreferences("arquivo_preferencias", Context.MODE_PRIVATE);

        mLikeCounter = mPrefs.getInt("num_likes", 0);

        TextView likesText = (TextView) findViewById(R.id.likes_text);
        String zeroLikes = getResources().getString(R.string.like_counter, mLikeCounter);
        likesText.setText(zeroLikes);

    }

    protected void onPause() {
        super.onPause();
        SharedPreferences.Editor editor = mPrefs.edit();
        editor.putInt("num_likes", mLikeCounter);
        editor.apply();
    }

    public void likeClicked(View view) {
        mLikeCounter++;

        String someLikes = getResources().getString(R.string.like_counter, mLikeCounter);
        TextView likesText = (TextView) findViewById(R. id.likes_text);
        likesText.setText(someLikes);

        Intent serviceIntent = new Intent(MainActivity.this, ToastIntentService.class);
        MainActivity.this.startService(serviceIntent);
    }

    public void onClickImage(View view) {

        Intent serviceIntent = new Intent(MainActivity.this, ToastIntentService.class);
        startService(serviceIntent);

        Log.d("debug", "starting intentServic5e");
        Intent intent = new Intent(this, PictureActivity.class);
        startActivity(intent);



    }

}

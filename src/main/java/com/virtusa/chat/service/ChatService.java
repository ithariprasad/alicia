package com.virtusa.chat.service;

import org.json.JSONException;

import java.io.IOException;
import java.net.URISyntaxException;

/**
 * Created by Hariprasad on 7/26/2015.
 */
public interface ChatService {
    String talk(String humanInput) throws JSONException, URISyntaxException, IOException;
}

package com.virtusa.chat.service.impl;

import com.pandorabots.api.PandorabotsAPI;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URISyntaxException;

/**
 * Created by Hariprasad on 7/26/2015.
 */
public class ChatServiceImpl implements ChatService {

    @Value("${chatbot.name}")
    private String chatBotName;

    private PandorabotsAPI chatBotService;

    public ChatServiceImpl(String chatHostName, String chatAppID, String chatUserKey) {
        chatBotService = new PandorabotsAPI(chatHostName, chatAppID, chatUserKey);
    }

    @Override
    public String talk(String humanInput) throws JSONException, URISyntaxException, IOException {
        return chatBotService.talk(chatBotName, humanInput);
    }


}

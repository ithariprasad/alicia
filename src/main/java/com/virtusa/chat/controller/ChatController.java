package com.virtusa.chat.controller;

/**
 * Created by Hariprasad Manoharan on 7/26/2015.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.virtusa.chat.service.impl.ChatService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller receives all chat requests.
 *
 * @author Hariprasad Manoharan
 */
@Controller
public class ChatController {

    /**
     * Logger instance for ChatController
     */
    private static final Logger LOGGER = Logger.getLogger(ChatController.class.getName());

    @Autowired
    public ChatService chatService;

    /**
     * Main marketing page
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView main(HttpServletRequest request, HttpSession session) {
        ModelAndView model = new ModelAndView();
        model.setViewName("main");
        return model;
    }

    /**
     * Chat calls service and returns response to UI.
     *
     * @param input
     * @return model object.
     */
    @RequestMapping(value = "/chat", method = RequestMethod.GET, produces = "text/plain")
    @ResponseBody
    public String login(
            @RequestParam(value = "input", required = false) String input,
            HttpServletRequest request, HttpSession session) {
        String response = null;
        if (input != null) {
            try {
                response = chatService.talk(input);
            } catch (Exception e) {
                response = "Error: " + e.getMessage();

            }
        }
        return response;
    }

    /**
     * Handle home page request
     *
     * @return model object.
     */
    @RequestMapping(value = "/chatnew", method = RequestMethod.GET)
    public ModelAndView appHome(HttpServletRequest request, HttpSession session) {
        ModelAndView model = new ModelAndView();
        model.addObject("username", "");
        model.setViewName("home");
        return model;
    }


}

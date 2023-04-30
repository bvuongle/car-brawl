#ifndef CARSPRITE_H
#define CARSPRITE_H

#include <SFML/Graphics.hpp>
#include <vector>
#include <algorithm>
#include <cctype>
#include <string>
#include "carObj.hpp"
#include "assetPaths.hpp"
#include "exception.hpp"

class CarSprite : public sf::Sprite
{
public:
    CarSprite(const std::string &color = "red", float x = 0, float y = 0, float scale = 1);
    CarSprite &operator=(const CarSprite &other);
    void setColor(const std::string &color);
    std::string getColor() const;
    int getKeyAction() const;
    int getScale() const;
    float getX() const;
    float getY() const;

    void reloadTextures();
    void updateDirectionTexture();
    void setNextAction(bool &WPressed, bool &APressed, bool &SPressed, bool &DPressed);
    void noMovementKeyPressed();
    void move();
    void restartPosition();
    bool checkCollision(const CarSprite &other);
    sf::Vector2f getVelocity();
    void getPushed(float opXV, float opYV);
    void push(float opXV, float opYV);
    CarObj &getCarObj();
    void loadStartingPosition(unsigned int carId);

private:
    std::string toLowerCase(const std::string &str);
    unsigned int keyAction = 8;
    float scale = 1.0;
    float x = 300;
    float y = 300;
    std::vector<sf::Texture> textures;
    CarObj carObj;
    std::string color = "";
    sf::Texture initialTexture;
    sf::Clock timeSinceCollision;
};

#endif
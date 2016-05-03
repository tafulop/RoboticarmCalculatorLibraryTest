/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: fulop
 *
 * Created on May 3, 2016, 12:43 PM
 */

#include <cstdlib>
#include "../CalculatorLibrary/ForwardKinematics.h"
#include <iostream>


using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {

  
    ForwardKinematics& inst = ForwardKinematics::getInstance();
    
    // create and store matrices
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(90, 5, 0,   10));
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(0, 10, 90,  0));
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(90, 0, 0,   0));
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(-90,0, 0,   20));
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(90, 0, 0,   0));
    inst.storeDHTMatrix(new DenavitHartenbergMatrix(0,  0, 90,  10));
    
    // manual calc one
    inst.setRefreshRate(1000);
    
    inst.setAutorun(true);
    

    while(1){
        arma::fmat res = inst.getEffectorPosition();
        this_thread::sleep_for(std::chrono::seconds(1));
    }
    
    
    //std::cout << "result:" << std::endl << res << std::endl;
    
    
    return 0;
}

void test_bare_dht(){
    
    using namespace arma;
    
    RoboticArm::Joint* j1 = new RoboticArm::Joint("Joint 1", 1, 1, -170, +170);
    std::vector<DenavitHartenbergMatrix*> matrices;
    
    
    // alfa , a , theta , d
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(90, 5, 0, 10));
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(0, 10, 90, 0));
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(90, 0, 0, 0));
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(-90, 0, 0, 20));
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(90, 0, 0, 0));
    matrices.emplace(matrices.end(), new DenavitHartenbergMatrix(0, 0, 90, 10));
    
    // refresh data
    for(DenavitHartenbergMatrix* m : matrices){
        m->calcValue();
        std::cout << "Refreshed:" << std::endl << *m->getMatrix() << std::endl;
        std::cout << "------------------------------------------------------" << std::endl;
    }
    
    

    arma::fmat* origin_matrix = matrices.front()->getMatrix();
    
    for(std::vector<DenavitHartenbergMatrix*>::iterator it = matrices.begin() + 1; it != matrices.end(); ++it){
       arma::fmat* temp = (*it)->getMatrix();
       *origin_matrix = *origin_matrix * *temp;
       std::cout << *origin_matrix << std::endl;
       std::cout << "------------------------------------------------------" << std::endl;
    }
    
    
    // create vector
    arma::fmat v = fmat(4,1);
    v.at(0,0) = 0; 
    v.at(1,0) = 0;
    v.at(2,0) = 0;
    v.at(3,0) = 1;
   
    
    auto result =  *origin_matrix * v;


    std::cout << "Vector is: " << std::endl << v << std::endl;
    std::cout << "Result: " << std::endl << result << std::endl;
    
}
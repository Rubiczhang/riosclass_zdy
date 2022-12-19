#ifndef __PORT_HH__
#define __PORT_HH__

#include <queue>
#include <memory>
#include <iostream>

namespace Emulator
{
  template <typename T>

  class Port{
    // Attribute
    private:
      bool m_stall;
      bool m_flush;
    
    public:
      std::shared_ptr<T>         data;
      bool      valid;
    //methods
    public:
      Port(
        bool stall,
        bool flush,
      ) : m_stall(stall), m_flush(flush);

      ~Port(){};

      void set(std::shared_ptr<T> data){
        this->data = data;
      };
      void flush(){
        this->m_flush = true;
      }
      void stall(){
        this->m_stall = true;
      }
      bool isStalled(){
        return this->m_stall;
      }
  };
}

#endif
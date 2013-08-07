require 'spec_helper'

describe 'rpcbind' do
  describe 'package resource' do
    context 'with default params' do
      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with ensure absent' do
      let(:params) { {
        :package_ensure => 'absent',
      } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'absent',
          'name'   => 'rpcbind',
        })
      }
    end

    context 'with supplied string for package name' do
      let(:params) { {
        :package_name => 'my_rpcbind',
      } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => 'my_rpcbind',
        })
      }
    end

    context 'with supplied array for package name' do
      let(:params) { {
        :package_name => [ 'rpcbind', 'rpcbindfoo', 'rpcbindbar' ],
      } }

      it {
        should contain_package('rpcbind_package').with({
          'ensure' => 'installed',
          'name'   => [ 'rpcbind', 'rpcbindfoo', 'rpcbindbar' ],
        })
      }
    end
  end

  describe 'service resource' do
    context 'with default params' do
      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with ensure stopped' do
      let(:params) { {
        :service_ensure => 'stopped',
      } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'stopped',
          'name'   => 'rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with supplied string for service name' do
      let(:params) { {
        :service_name => 'my_rpcbind',
      } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'my_rpcbind',
          'enable' => true,
        })
      }
    end

    context 'with enable false' do
      let(:params) { {
        :service_enable => false,
      } }

      it {
        should contain_service('rpcbind_service').with({
          'ensure' => 'running',
          'name'   => 'rpcbind',
          'enable' => false,
        })
      }
    end
  end
end

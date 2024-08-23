
package com.example.apelabs

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()





// Don't remove
//package com.example.apelabs
//
//import android.bluetooth.BluetoothAdapter
//import android.bluetooth.BluetoothDevice
//import android.os.Bundle
//import android.bluetooth.BluetoothManager
//import android.bluetooth.BluetoothProfile
//import android.content.Context
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//import com.google.gson.Gson
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "com.example.apelabs/bluetooth"
//
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            when (call.method) {
//                "getPairedDevices" -> result.success(getPairedDevices())
//                "getConnectedDevices" -> result.success(getConnectedDevices())
//                "getAvailableDevices" -> result.success(getAvailableDevices())
//                else -> result.notImplemented()
//            }
//        }
//    }
//
//    private fun getPairedDevices(): String {
//        val bluetoothAdapter: BluetoothAdapter? = BluetoothAdapter.getDefaultAdapter()
//        val pairedDevices = bluetoothAdapter?.bondedDevices ?: emptySet<BluetoothDevice>()
//        val deviceList = pairedDevices.map { device ->
//            mapOf(
//                "id" to device.address,
//                "name" to (device.name ?: "Unknown")
//            )
//        }
//        return Gson().toJson(deviceList)
//    }
//
//    private fun getConnectedDevices(): String {
//        val bluetoothManager = getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
//        val connectedDevices = bluetoothManager.getConnectedDevices(BluetoothProfile.GATT)
//        val deviceList = connectedDevices.map { device ->
//            mapOf(
//                "id" to device.address,
//                "name" to (device.name ?: "Unknown")
//            )
//        }
//        return Gson().toJson(deviceList)
//    }
//
//    private fun getAvailableDevices(): String {
//        val bluetoothAdapter: BluetoothAdapter? = BluetoothAdapter.getDefaultAdapter()
//        val availableDevices = mutableListOf<Map<String, String>>()
//
//        val discoverCallback = BluetoothAdapter.LeScanCallback { device, _, _ ->
//            availableDevices.add(
//                mapOf(
//                    "id" to device.address,
//                    "name" to (device.name ?: "Unknown")
//                )
//            )
//        }
//
//        bluetoothAdapter?.startLeScan(discoverCallback)
//        Thread.sleep(5000)
//        bluetoothAdapter?.stopLeScan(discoverCallback)
//
//        return Gson().toJson(availableDevices)
//    }
//}


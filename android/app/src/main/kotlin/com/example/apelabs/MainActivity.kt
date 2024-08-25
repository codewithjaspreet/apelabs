package com.example.bluetoothapp

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothGattCallback
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.apelabs/bluetooth"
    private var bluetoothAdapter: BluetoothAdapter? = null
    private var bluetoothGatt: BluetoothGatt? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        // Inside onCreate method or where you initialize MethodChannel
        val binaryMessenger = flutterEngine?.dartExecutor?.binaryMessenger

        if (binaryMessenger != null) {
            MethodChannel(binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "getPairedDevices" -> {
                        val pairedDevices = getPairedDevices()
                        result.success(pairedDevices)
                    }
                    "getConnectedDevices" -> {
                        val connectedDevices = getConnectedDevices()
                        result.success(connectedDevices)
                    }
                    "startDiscovery" -> {
                        startDiscovery()
                        result.success("Discovery started")
                    }
                    "stopDiscovery" -> {
                        stopDiscovery()
                        result.success("Discovery stopped")
                    }
                    "connectToDevice" -> {
                        val address = call.argument<String>("address")
                        if (address != null) {
                            connectToDevice(address)
                            result.success("Connecting to $address")
                        } else {
                            result.error("UNAVAILABLE", "Bluetooth device address not provided", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
        } else {
            Log.e("MainActivity", "BinaryMessenger is null, MethodChannel not initialized")
        }


//        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//
//        }
    }

    private fun getPairedDevices(): List<Map<String, String>> {
        val pairedDevices: Set<BluetoothDevice>? = bluetoothAdapter?.bondedDevices
        return pairedDevices?.map { device ->
            mapOf("name" to (device.name ?: "Unknown"), "address" to device.address)
        } ?: emptyList()
    }

    private fun getConnectedDevices(): List<Map<String, String>> {
        val connectedDevices: List<BluetoothDevice> = bluetoothAdapter?.bondedDevices?.filter { device ->
            device.type == BluetoothDevice.DEVICE_TYPE_CLASSIC || device.type == BluetoothDevice.DEVICE_TYPE_DUAL
        } ?: emptyList()

        return connectedDevices.map { device ->
            mapOf("name" to (device.name ?: "Unknown"), "address" to device.address)
        }
    }

    private val discoveryReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val action: String? = intent.action
            if (BluetoothDevice.ACTION_FOUND == action) {
                val device: BluetoothDevice? = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE)
                device?.let {
                    val deviceMap = mapOf("name" to (it.name ?: "Unknown"), "address" to it.address)

                    val binaryMessenger = flutterEngine?.dartExecutor?.binaryMessenger
                    if (binaryMessenger != null) {
                        MethodChannel(binaryMessenger, CHANNEL).invokeMethod("onDeviceDiscovered", deviceMap)
                    } else {
                        Log.e("MainActivity", "BinaryMessenger is null, unable to send device issue tracking by shivanshu in main.kt")
                    }
                }
            }
        }
    }

    private fun startDiscovery() {
        val filter = IntentFilter(BluetoothDevice.ACTION_FOUND)
        registerReceiver(discoveryReceiver, filter)
        bluetoothAdapter?.startDiscovery()
    }

    private fun stopDiscovery() {
        unregisterReceiver(discoveryReceiver)
        bluetoothAdapter?.cancelDiscovery()
    }

    private fun connectToDevice(address: String) {
        val device = bluetoothAdapter?.getRemoteDevice(address)
        bluetoothGatt = device?.connectGatt(this, false, object : BluetoothGattCallback() {
            override fun onConnectionStateChange(gatt: BluetoothGatt, status: Int, newState: Int) {
                when (newState) {
                    BluetoothGatt.STATE_CONNECTED -> {
                        Log.d("Bluetooth", "Connected to ${device?.name ?: "Unknown"}")
                    }
                    BluetoothGatt.STATE_DISCONNECTED -> {
                        Log.d("Bluetooth", "Disconnected from ${device?.name ?: "Unknown"}")
                    }
                }
            }
        })
    }

    override fun onDestroy() {
        super.onDestroy()
        stopDiscovery()
        bluetoothGatt?.close()
    }
}
